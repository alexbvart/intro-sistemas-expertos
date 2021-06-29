% Copyright

implement taskWindow inherits applicationWindow
    open core, vpiDomains

constants
    mdiProperty : boolean = true.

clauses
    new() :-
        applicationWindow::new(),
        generatedInitialize().

class predicates
    onDestroy : window::destroyListener.
clauses
    onDestroy(_).

predicates
    onSizeChanged : window::sizeListener.
clauses
    onSizeChanged(_) :-
        vpiToolbar::resize(getVPIWindow()).

predicates
    onFileOpen : window::menuItemListener.
clauses
    onFileOpen(_Source, _MenuTag).

predicates
    onSalir : window::menuItemListener.
clauses
    onSalir(_Source, _MenuTag) :-
        close().

predicates
    onArchivoPromedio : window::menuItemListener.
clauses
    onArchivoPromedio(_Source, _MenuTag) :-
        _ = dlgNotas::display(This).
% This code is maintained automatically, do not update it manually.
%  10:21:58-22.6.2021

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("ProyectoPromedios"),
        setDecoration(titlebar([closeButton, maximizeButton, minimizeButton])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings]),
        whenCreated({  :- projectToolbar::create(getVpiWindow()) }),
        addSizeListener({  :- vpiToolbar::resize(getVpiWindow()) }),
        setMdiProperty(mdiProperty),
        menuSet(resMenu(resourceIdentifiers::id_TaskMenu)),
        addSizeListener(onSizeChanged),
        addDestroyListener(onDestroy),
        addMenuItemListener(resourceIdentifiers::id_file_open, onFileOpen),
        addMenuItemListener(resourceIdentifiers::id_salir, onSalir),
        addMenuItemListener(resourceIdentifiers::id_archivo_promedio, onArchivoPromedio).
% end of automatic code

end implement taskWindow
