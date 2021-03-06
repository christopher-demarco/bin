#!/usr/bin/env python

import os

import xml.etree.ElementTree as etree


SRCDIR = "/Users/cmd/Desktop/BAK/Evernote"
DSTDIR = "/Users/cmd/tmp/Evernote"
NOTEBOOK = "Zek"



def _find_notebook(name):
    return '{}/{}.enex'.format(SRCDIR, name)


def _find_notebook_output_dir(notebook_name):
    return '{}/{}'.format(DSTDIR, notebook_name)


def _make_dir_if_not_exists(d):
    try: os.makedirs(d)
    except FileExistsError:
        pass
    return d


def _prep_output_dir(outputdir):
    return _make_dir_if_not_exists(outputdir)
    

def _get_list(xmlfile):
    return etree.parse(xmlfile).getiterator()


def _find_filename(note):
    for fn in [
            'file-name',
            'title',
    ]:
        filename = note.get(fn)
        if filename:
            return filename


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


def write_note(note, notebook_dir):
    return "Writing {} to {}/{}.".format(
        note.get('title'),
        notebook_dir,
        _find_filename(note)
    ) 


def write_notebook(notebook_name, notes):
    return [
        write_note(
            note,
            _prep_output_dir(
                _find_notebook_output_dir(notebook_name)
            ),
        )
        for note
        in notes
    ]
        

def go():
    return write_notebook(
        NOTEBOOK,
        collate_notes(
            parse_enex(
                _find_notebook(NOTEBOOK)
            )
        )
    )
    

if __name__ == '__main__':
    print(go())
    
