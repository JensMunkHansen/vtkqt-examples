CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

PROJECT( BasicVTKPipeline )

FIND_PACKAGE(VTK COMPONENTS
  vtkCommonCore
  vtkFiltersSources
  vtkGUISupportQt
  vtkIOImage
  vtkInteractionImage)

INCLUDE( ${VTK_USE_FILE} )

ADD_EXECUTABLE( VTKWithInteraction BasicVTKPipeline.cxx )
TARGET_LINK_LIBRARIES( VTKWithInteraction ${VTK_LIBRARIES} )
