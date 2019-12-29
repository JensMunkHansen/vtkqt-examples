#include <QApplication>
#include <QSurfaceFormat>
#include <QVTKOpenGLWidget.h>

#include "SimpleViewUI.h"

int main( int argc, char** argv ) {
  QSurfaceFormat::setDefaultFormat(QVTKOpenGLWidget::defaultFormat());

  // QT Stuff
  QApplication app( argc, argv );

  SimpleView mySimpleView;
  mySimpleView.show();

  return app.exec();
}
