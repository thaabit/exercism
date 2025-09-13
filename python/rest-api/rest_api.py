import json

class RestAPI:
    def __init__(self, database=None):
        self.database = database or {"users":[]}

    def get(self, url, payload=None):
        all_users = self.database["users"]
        if payload:
            selected_user = json.loads(payload)["users"][0]
            all_users = [self._find_user(selected_user)]
        all_users = sorted(all_users, key=lambda user: user['name'])
        return json.dumps({ "users": all_users })


    def post(self, url, payload=None):
        payload = json.loads(payload)
        if url == '/add':
            user = {
                "owes":    {},
                "owed_by": {},
                "balance": 0.0,
                "name": payload["user"],
            }
            self.database["users"].append(user)
            return json.dumps(user)
        elif url == '/iou':
            lender = self._find_user(payload["lender"])
            borrower = self._find_user(payload["borrower"])
            amount = payload["amount"]
            lname = lender["name"]
            bname = borrower["name"]

            lender["balance"] += amount
            borrower["balance"] -= amount

            borrower_owes_lender = borrower["owes"].get(lname, 0) + amount - borrower["owed_by"].get(lname, 0)
            lender_owes_borrower = lender["owes"].get(bname, 0) - amount + lender["owed_by"].get(bname, 0)

            if borrower_owes_lender > 0:
                borrower["owes"][lname] = borrower_owes_lender
                borrower["owed_by"].pop(lname, None)
            elif borrower_owes_lender < 0:
                borrower["owed_by"][lname] = -borrower_owes_lender
                borrower["owes"].pop(lname, None)

            if lender_owes_borrower > 0:
                lender["owes"][bname] = lender_owes_borrower
                lender["owed_by"].pop(bname, None)
            elif lender_owes_borrower < 0:
                lender["owed_by"][bname] = -lender_owes_borrower
                lender["owes"].pop(bname, None)

            if lender_owes_borrower == 0:
                borrower["owes"].pop(lname, None)
                borrower["owed_by"].pop(lname, None)
                lender["owes"].pop(bname, None)
                lender["owed_by"].pop(bname, None)

            users = sorted([lender, borrower], key=lambda user: user['name'])
            return json.dumps({ "users": users })

    def _find_user(self, name):
        for u in self.database["users"]:
            if u["name"] == name: return u
