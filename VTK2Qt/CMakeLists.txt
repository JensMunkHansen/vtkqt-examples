cmake_minimum_required(VERSION 2.8)

PROJECT(RenderWindowUI)

find_package(VTK COMPONENTS
  vtkCommonCore
  vtkFiltersSources
  vtkGUISupportQt
  vtkIOImage
  vtkInteractionImage
  )
if(NOT VTK_RENDERING_BACKEND)
  set(VTK_RENDERING_BACKEND OpenGL) # Support VTK version prior to introduction of rendering backend
endif()

INCLUDE(${VTK_USE_FILE}) # include UseVTK.cmake

FIND_PACKAGE(Qt5 COMPONENTS Widgets REQUIRED QUIET)

set(CMAKE_AUTOMOC ON)

# support for out-of-source build
INCLUDE_DIRECTORIES(
  ${CMAKE_CURRENT_BINARY_DIR} #this is where ui_SimpleViewUI.h is generated
  ${CMAKE_CURRENT_SOURCE_DIR}
)

#A pure VTK example of what we want to emulate
ADD_EXECUTABLE( Slider Slider.cxx )
TARGET_LINK_LIBRARIES( Slider ${VTK_LIBRARIES} ${QT_LIBRARIES})

#Now the QtVTK version
SET(SimpleViewSrcs RenderWindowUI.cxx SimpleViewUI.cxx)
SET(SimpleViewUI SimpleViewUI.ui)
SET(SimpleViewHeaders SimpleViewUI.h)

QT5_WRAP_UI(UISrcs ${SimpleViewUI})

SOURCE_GROUP("Resources" FILES
  ${SimpleViewUI}
)

SOURCE_GROUP("Generated" FILES
  ${UISrcs}
  ${MOCSrcs}
)

ADD_EXECUTABLE( SliderGUI ${SimpleViewSrcs} ${UISrcs} ${MOCSrcs})
TARGET_LINK_LIBRARIES( SliderGUI Qt5::Core Qt5::Gui Qt5::Widgets)
TARGET_LINK_LIBRARIES( SliderGUI ${VTK_LIBRARIES})
