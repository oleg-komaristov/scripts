import QtQml 2.0

/**
 * The script replaces " " "/" symbols in the not file name.
 */
QtObject {
    
    function handleNoteTextFileNameHook(note) {
        // the current note name is the fallback
        var headLine = note.name;

        // get a list of note text lines
        var noteLines = note.noteText.split("\n");

        // set the first line of the note as base for the file name
        if (noteLines.length > 0) {
            // you maybe also want to exclude some disallowed characters here
            headLine = noteLines[0];
        }
        
        var fileName = headLine.replace(/#/g, "").replace(/\//g, " or ").trim().replace(/ /g, "-").toLowerCase();

        script.log("file name: " + fileName);

        var noteExists = script.noteExistsByFileName(fileName + ".md", note.id);
        script.log("note " + (noteExists ? "exists" : "doesn't exist"));

        return fileName;
    }
}
