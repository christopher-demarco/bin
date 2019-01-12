#!/usr/bin/env python

from lxml import etree


DIR = "/Users/cmd/Desktop/BAK/Evernote"
NOTEBOOK = "foo"


def get_parser():
    return etree.XMLParser(remove_blank_text=True, resolve_entities=False)


def _get_context(xmlfile):
    return etree.iterparse(xmlfile, encoding='utf-8', strip_cdata=False)


def parse_enex(enex_path):
    return [
        elem
        for
        (action, elem)
        in
        _get_context(enex_path)
    ]


def elements_to_dict(elements):
    return dict(
        [(x.tag, x.text) for x in elements]
    )


def collate_notes(list_of_notes):
    note = []
    note.append(list_of_notes.pop(0))        

    for item in list_of_notes:
        if list_of_notes[0].tag == 'title':
            return elements_to_dict(note), collate_notes(list_of_notes)
        else:
            note.append(list_of_notes.pop(0))

    return elements_to_dict(note)


def write_note(note):
    return note


def go():
    return [write_note(note)
            for note
            in collate_notes(
                parse_enex(
                    "{}/{}.enex".format(DIR, NOTEBOOK)
                )
            )
    ]
    
