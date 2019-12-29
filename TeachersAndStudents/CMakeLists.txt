PROJECT( BasicQtSlotSignalExample )

CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

FIND_PACKAGE( Qt5 COMPONENTS Core Widgets PrintSupport REQUIRED)

set(CMAKE_AUTOMOC ON)

SET( HEADERS Teacher.h Student.h )
SET( CXX Teacher.cxx Student.cxx)

INCLUDE_DIRECTORIES( ${CMAKE_CURRENT_BINARY_DIR})

ADD_EXECUTABLE( SlotSignalExample SlotSignalExample.cxx ${CXX} ${MOCS})

qt5_use_modules(SlotSignalExample Widgets)

TARGET_LINK_LIBRARIES( SlotSignalExample ${QT_LIBRARIES} )
