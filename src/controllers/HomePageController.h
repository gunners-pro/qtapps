#ifndef HOMEPAGECONTROLLER_H
#define HOMEPAGECONTROLLER_H

#pragma once
#include <QObject>

class HomePageController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int contador READ contador NOTIFY contadorChanged)
public:
    explicit HomePageController(QObject *parent = nullptr);

    int contador() const;
    Q_INVOKABLE void incrementar();
    Q_INVOKABLE void decrementar();

signals:
    void contadorChanged();

private:
    int m_contador = 0;
};

#endif // HOMEPAGECONTROLLER_H
