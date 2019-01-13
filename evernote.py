#!/usr/bin/env python

import xml.etree.ElementTree as etree


DIR = "/Users/cmd/Desktop/BAK/Evernote"
NOTEBOOK = "tab"


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
    # return [x.text for x in elements if x.tag == 'title']
    return dict(
        [(x.tag, x.text) for x in elements]
    )


def collate_notes(notes):
    note = []
    note.append(notes.pop(0))        

    for i in range(len(notes)):
        if notes[i].tag == 'title':
            child = collate_notes(
                notes[i:]
            )
            return child + [elements_to_dict(note),]
        elif notes[i].tag == 'data':
            pass
        else:
            note.append(notes[i])
    return [elements_to_dict(note),]


def write_note(note):
    return note


def go():
    return collate_notes(
            parse_enex(
                _find_notebook(NOTEBOOK)
            )
        )
    

if __name__ == '__main__':
    print(go())
    
