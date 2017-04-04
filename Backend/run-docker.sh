#/bin/bash


docker run --rm -it -v /Users/fmichel/Desktop/swift/GeburtstagsWebApp_Kopie/Backend/GeburtztagsKalender:/GebKalenderBackend/ -p 8080:8080 --name geburtstagskalender --link geburtstagskalenderdb geburtstagskalenderbackend:2.0

