#include <QApplication>
#include <QSurfaceFormat>
#include <QVTKOpenGLWidget.h>

#include "SimpleMainWindow.h"

int main( int argc, char** argv ) {
  QSurfaceFormat::setDefaultFormat(QVTKOpenGLWidget::defaultFormat());
  QApplication app(argc, argv);

  SimpleMainWindow mainWindow;

  mainWindow.show();

  return( app.exec() );
}
