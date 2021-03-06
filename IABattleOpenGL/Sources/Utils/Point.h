#ifndef POINT_H
#define POINT_H
#include <math.h>
#include <ostream>

static const float X_MIN = -50.f;
static const float X_MAX = 50.f;
static const float Y_MIN = -50.f;
static const float Y_MAX = 50.f;

class Point
{
    public:
		Point();
        Point(float, float);
		Point& operator=(const Point&);

        float getX() const { return m_x; }
        float getY() const { return m_y; }
        static double getDistance(const Point& p1, const Point& p2)
        {
			return sqrt(static_cast<double>((p1.m_x - p2.m_x)*(p1.m_x - p2.m_x) + (p1.m_y - p2.m_y)*(p1.m_y - p2.m_y)));
        }
		Point getNextPosWithSpeed(const Point&, float) const;

    private:
		friend std::ostream & operator<<(std::ostream &os, const Point& p);

        float m_x;
        float m_y;
};

#endif // POINT_H
