# -*- coding: utf-8 -*-
from datetime import datetime

class LedgerEntry:
    def __init__(self, date=None, description=None, change=None):
        self.date = date
        self.description = description
        self.change = change

def create_entry(date, description, change):
    entry = LedgerEntry(datetime.strptime(date, '%Y-%m-%d'), description, change)
    return entry


def format_entries(currency, locale, entries):
    header = "{:<10} | {:<25} | {:<13}"
    row = "{:<10} | {:<25} | {:>13}"
    table = header.format('Date', 'Description', 'Change') if locale == 'en_US' else header.format('Datum', 'Omschrijving', 'Verandering')

    for entry in sorted(entries, key = lambda x: (x.date, x.change, x.description)):
        table += '\n'

        month = str(entry.date.month).rjust(2, '0')
        day =  str(entry.date.day).rjust(2, '0')
        year = str(entry.date.year).rjust(4, '0')
        date_str = f"{month}/{day}/{year}" if locale == 'en_US' else f"{day}-{month}-{year}"
        description = entry.description[:22] + '...' if len(entry.description) > 25 else entry.description

        symbol = '$' if currency == 'USD' else u'€'
        if locale == 'en_US':
            change_str = '{}{:,.2f} '.format(symbol, entry.change/100) if entry.change >= 0 else '({}{:,.2f})'.format(symbol, abs(entry.change/100))
        else:
            change_str = '{} {:,.2f} '.format(symbol, entry.change/100)
            dollars, cents = change_str.split(".")[0], change_str.split(".")[1]
            change_str = dollars.replace(",", ".") + ',' + cents
        table += row.format(date_str, description, change_str)
    return table
