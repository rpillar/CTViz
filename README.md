# CTViz
Visualisation tool - written in Pharo using the Seaside web framework

Add Dependencies :-
```
Metacello new
 baseline:'Seaside3';
 repository: 'github://SeasideSt/Seaside:master/repository';
 load.
```
```
Metacello new
  repository: 'github://pharo-rdbms/Pharo-SQLite3/src';
  baseline: 'SQLite3';
  load.
```
```
Metacello new
  baseline: 'Teapot';
  repository: 'github://zeroflag/Teapot/source';
  load.
```
```
Metacello new
  baseline: 'Buoy';
  repository: 'github://ba-st/Buoy:release-candidate';
  load: 'Development'.
```
Add the `WAOnlineLibrary` class from the `Boardwalk` package (ba-st on GitHub)

If there are issues loading any of the libraries needed by this app then :-
```
CTVizRootTask register.
```
Edit the `register` method as required.

Note :- it may be _easier_ to load the Boardwalk package - adds a number of extensions to Seaside.

Have Fun.
