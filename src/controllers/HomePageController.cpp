#include "HomePageController.h"

HomePageController::HomePageController(QObject *parent)
    : QObject{parent}
{}

int HomePageController::contador() const {
    return m_contador;
}

void HomePageController::incrementar() {
    m_contador++;
    emit contadorChanged();
}

void HomePageController::decrementar() {
    if (m_contador > 0)
    {
        m_contador--;
        emit contadorChanged();
    }
}
