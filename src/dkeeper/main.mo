import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);

    Debug.print(debug_show(notes));

  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };


  // public func removeAtIndex(list: List.List<Note>, index: Nat): async List.List<Note> {
  //   let list1 = List.take(list, index);
  //   let list2 = List.drop(list, (index+1));

  //   let newList = List.append(list1, list2);

  //   return newList;
  // };


  public func removeNote(id: Nat) {
    let list1 = List.take(notes, id);
    let list2 = List.drop(notes, (id+1));

    let newList = List.append(list1, list2);

    notes := newList;
  };

}