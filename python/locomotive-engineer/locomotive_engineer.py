import copy
"""Functions which helps the locomotive engineer to keep track of the train."""


def get_list_of_wagons(*args):
    """Return a list of wagons.

    :param: arbitrary number of wagons.
    :return: list - list of wagons.
    """
    return [*args]


def fix_list_of_wagons(each_wagons_id, missing_wagons):
    """Fix the list of wagons.

    :param each_wagons_id: list - the list of wagons.
    :param missing_wagons: list - the list of missing wagons.
    :return: list - list of wagons.
    """
    one, two, first, *etc = each_wagons_id
    new_list = [first, *missing_wagons, *etc, one, two]
    return new_list


def add_missing_stops(routing, **kwargs):
    """Add missing stops to route dict.

    :param route: dict - the dict of routing information.
    :param: arbitrary number of stops.
    :return: dict - updated route dictionary.
    """
    stops = []
    for stop in dict(sorted(kwargs.items())):
        stops.append(kwargs[stop])
    routing['stops'] = stops

    return routing


def extend_route_information(route, more_route_information):
    """Extend route information with more_route_information.

    :param route: dict - the route information.
    :param more_route_information: dict -  extra route information.
    :return: dict - extended route information.
    """
    return {**route, **more_route_information}


def fix_wagon_depot(wagon_rows):
    """Fix the list of rows of wagons.

    :param wagon_rows: list[list[tuple]] - the list of rows of wagons.
    :return: list[list[tuple]] - list of rows of wagons.
    """
    fixed = copy.deepcopy(wagon_rows)
    for x in range(3):
        for y in range(3):
            fixed[x][y] = wagon_rows[y][x]
    return fixed
