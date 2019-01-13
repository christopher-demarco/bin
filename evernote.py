#!/usr/bin/env python

import xml.etree.ElementTree as etree


DIR = "/Users/cmd/Desktop/BAK/Evernote"
NOTEBOOK = "foo"


def _find_notebook(name):
    return '{}/{}.enex'.format(DIR, name)


def _get_list(xmlfile):
    return etree.parse(xmlfile).getiterator()


def parse_enex(enex_path):
    return [
        element
        for
        element
        in
        _get_list(enex_path)
    ]


def elements_to_dict(elements):
    return dict(
        [(x.tag, x.text) for x in elements]
    )


def collate_notes(list_of_notes):
    note = []
    note.append(list_of_notes.pop(0))        

    for i in range(len(list_of_notes)):
        if list_of_notes[i].tag == 'title':
            return elements_to_dict(note), collate_notes(list_of_notes[i:])
        else:
            note.append(list_of_notes[i])

    return elements_to_dict(note)


def write_note(note):
    return note


def go():
    return [write_note(note)
            for note
            in collate_notes(
                parse_enex(
                    _find_notebook(NOTEBOOK)
                )
            )
    ]
    

if __name__ == '__main__':
    print(go())
    
