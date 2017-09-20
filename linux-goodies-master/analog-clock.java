import com.trolltech.qt.core.QPoint;
import com.trolltech.qt.core.QSize;
import com.trolltech.qt.core.QTime;
import com.trolltech.qt.core.QTimer;
import com.trolltech.qt.gui.QApplication;
import com.trolltech.qt.gui.QColor;
import com.trolltech.qt.gui.QHideEvent;
import com.trolltech.qt.gui.QIcon;
import com.trolltech.qt.gui.QPaintEvent;
import com.trolltech.qt.gui.QPainter;
import com.trolltech.qt.gui.QPen;
import com.trolltech.qt.gui.QPolygon;
import com.trolltech.qt.gui.QShowEvent;
import com.trolltech.qt.gui.QWidget;

/****************************************************************************
**
** Copyright (C) 1992-2009 Nokia. All rights reserved.
**
** This file is part of Qt Jambi.
**
** ** $BEGIN_LICENSE$
** Commercial Usage
** Licensees holding valid Qt Commercial licenses may use this file in
** accordance with the Qt Commercial License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Nokia.
** 
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
** 
** In addition, as a special exception, Nokia gives you certain
** additional rights. These rights are described in the Nokia Qt LGPL
** Exception version 1.0, included in the file LGPL_EXCEPTION.txt in this
** package.
** 
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
** 
** If you are unsure which license is appropriate for your use, please
** contact the sales department at qt-sales@nokia.com.
** $END_LICENSE$

**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/






public class AnalogClock
    extends QWidget
{
    static QPolygon hourHand = new QPolygon();
    static QPolygon minuteHand = new QPolygon();
    static {
        hourHand.append(new QPoint(7, 8));
        hourHand.append(new QPoint(-7, 8));
        hourHand.append(new QPoint(0, -40));

        minuteHand.append(new QPoint(7, 8));
        minuteHand.append(new QPoint(-7, 8));
        minuteHand.append(new QPoint(0, -70));
    }

    QTimer m_timer = new QTimer(this);

    public AnalogClock() {
        this(null);
    }

    public AnalogClock(QWidget parent) {
        super(parent);
        m_timer.timeout.connect(this, "update()");

        setWindowTitle("Analog clock");
        setWindowIcon(new QIcon("classpath:com/trolltech/images/qt-logo.png"));
        resize(200, 200);
    }

    @Override
    protected void paintEvent(QPaintEvent e)
    {
        QColor hourColor = new QColor(127, 0, 127);
        QColor minuteColor = new QColor(0, 127, 127, 191);

        int side = width() < height() ? width() : height();

        QTime time = QTime.currentTime();

        QPainter painter = new QPainter(this);
        painter.setRenderHint(QPainter.RenderHint.Antialiasing);
        painter.translate(width() / 2, height() / 2);
        painter.scale(side / 200.0f, side / 200.0f);

        painter.setPen(QPen.NoPen);
        painter.setBrush(hourColor);

        painter.save();
        painter.rotate(30.0f * ((time.hour() + time.minute() / 60.0f)));
        painter.drawConvexPolygon(hourHand);
        painter.restore();

        painter.setPen(hourColor);

        for (int i=0; i<12; ++i) {
            painter.drawLine(88, 0, 96, 0);
            painter.rotate(30.0f);
        }

        painter.setPen(QPen.NoPen);
        painter.setBrush(minuteColor);

        painter.save();
        painter.rotate(6.0f * (time.minute() + time.second() / 60.0f));
        painter.drawConvexPolygon(minuteHand);
        painter.restore();

        painter.setPen(minuteColor);

        for (int j=0; j<60; ++j) {
            if ((j % 5) != 0)
                painter.drawLine(92, 0, 96, 0);
            painter.rotate(6.0f);
        }
    }

    @Override
    public QSize sizeHint() {
        return new QSize(200, 200);
    }

    @Override
    public void showEvent(QShowEvent e) {
        m_timer.start(1000);
    }

    @Override
    public void hideEvent(QHideEvent e) {
        m_timer.stop();
    }

    static public void main(String args[])
    {
        QApplication.initialize(args);
        AnalogClock w = new AnalogClock();

        w.show();

        QApplication.exec();
        // QApplication.shutdown();
    }
}
