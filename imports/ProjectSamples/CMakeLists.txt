qt_add_library(ProjectSamples STATIC)
set_source_files_properties(Constants.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
    )

set_source_files_properties(EventsStore.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
    )

qt6_add_qml_module(ProjectSamples
	URI "ProjectSamples"
	VERSION 1.0
        QML_FILES
            Constants.qml
            EventsStore.qml
)
