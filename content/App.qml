// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import ProjectSamples
import QtQuick.Controls
import './components/search_widget'
import './components/'
import './pages'

ApplicationWindow {
    width: Constants.width
    height: Constants.height

    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    visible: true
    title: "ProjectSamples"
    color: Constants.applicationBackgroundColor

    StackView {
        id: pages_stack
        anchors.fill: parent
        initialItem: SearchPage {}
    }

    ModalWindow {}
}

