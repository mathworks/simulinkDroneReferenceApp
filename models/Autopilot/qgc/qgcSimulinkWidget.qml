/****************************************************************************
 * QML QGC Widget to Control a Simulink Model
 * Copyright 2018 The MathWorks, Inc.
 *
 ****************************************************************************/


import QtQuick              2.5
import QtQuick.Controls     1.4

import QGroundControl.FactSystem    1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0

SetupPage {
    id:             simulinkController
    pageComponent:  simulinkControllerComponent

    Component {
        id: simulinkControllerComponent

        Column {
            width:      availableWidth
            spacing:    _margins

            FactPanelController { id: controller; factPanel: simulinkController.viewPanel }

            QGCPalette { id: palette; colorGroupEnabled: true }

            property Fact _U_c:             controller.getParameterFact(-1, "CMDS_U_C")
            property Fact _h_c_midLevel:    controller.getParameterFact(-1, "CMDS_H_C_MIDL")
            property Fact _psiDot_c_midLevel: controller.getParameterFact(-1, "CMDS_PSID_C_M")
            property Fact _RTB:             controller.getParameterFact(-1, "CMDS_RTB")
            property Fact _followMobile:    controller.getParameterFact(-1, "CMDS_FOLLOW")
            property Fact _isManualModeOn:  controller.getParameterFact(-1, "CMDS_IS_MAN")
            property Fact _guidanceMode:    controller.getParameterFact(-1, "CMDS_GDNC_MD")
            property Fact _viewPointIdx:          controller.getParameterFact(-1, "CMDS_VIEW_IDX")

            Component.onCompleted: {
            // Things to do once launch is completed

                // Set RTB to the right state
                rtbSwitch.checked=  _RTB.value > 0.0 ? 1: 0
                if (rtbSwitch.checked > 0 ) {
                    sliderLabel.text = qsTr("Click to Continue Mission")
                } else {
                    sliderLabel.text = qsTr("Click to Return To Base")
                }

                // Set Guidance mode to the write state
                gdncSwitch.checked = _guidanceMode == 2.0 ? 0:1
                if (gdncSwitch.checked > 0 ) {
                    gdncModeLabel.text = qsTr("Click to Switch to Orbit Guidance")
                } else {
                    gdncModeLabel.text = qsTr("Click to Switch to WP Guidance")
                }
            }

            // Connections { target: _ch7Opt; onValueChanged: calcAutoTuneChannel() }


            QGCLabel {
                id:         basicLabel
                text:       qsTr("Control Simulink Model")
                font.family: ScreenTools.demiboldFontFamily
            }

            Flow {
                id:             flowLayout
                anchors.left:   parent.left
                anchors.right:  parent.right
                spacing:        _margins

                Rectangle {
                    height: rtbLabel.height + rtbRect.height
                    width:  rtbRect.width
                    color:  palette.window

                    QGCLabel {
                        id:                 rtbLabel
                        text:               qsTr("Ground Station Commands")
                        font.family:        ScreenTools.demiboldFontFamily
                    }

                    Rectangle {
                        id:             rtbRect
                        width:          rtbColumn.x + rtbColumn.width + _margins
                        height:         rtbColumn.y + rtbColumn.height + _margins
                        anchors.top:    rtbLabel.bottom
                        color:          palette.windowShade

                        Column {
                            id:                 rtbColumn
                            anchors.margins:    _margins
                            anchors.left:       parent.left
                            anchors.top:        parent.top
                            spacing:            _margins

                            Row {
                                spacing: _margins
                            }

                            Row {
                                spacing:    _margins
                                QGCLabel {
                                    id:                 sliderLabel
                                    //anchors.baseline:   rtbSwitch.baseline
                                    //text:               qsTr("Click to Return To Base")
                                }

                                Switch {
                                    id:     rtbSwitch   

                                    onClicked:{
                                        controller.getParameterFact(-1, "CMDS_RTB").value = rtbSwitch.checked

                                        if (rtbSwitch.checked > 0 ) {
                                            sliderLabel.text = qsTr("Click to Continue Mission")
                                        } else {
                                            sliderLabel.text = qsTr("Click to Return To Base")
                                        }
                                    }
                                 }                       
                            } // Row                                


                            Row {
                                spacing: _margins
                                 
                                 QGCLabel {
                                    id:                 gdncModeLabel
                                    //anchors.baseline:   rtbSwitch.baseline
                                    //text:               qsTr("Click to Return To Base")
                                }

                                Switch {
                                    id:     gdncSwitch   

                                    onClicked:{

                                        if (gdncSwitch.checked > 0 ) {
                                            controller.getParameterFact(-1, "CMDS_GDNC_MD").value = 2
                                            gdncModeLabel.text = qsTr("Click to Switch to Orbit Guidance")
                                        } else {
                                            controller.getParameterFact(-1, "CMDS_GDNC_MD").value = 3
                                            gdncModeLabel.text = qsTr("Click to Switch to WP Guidance")
                                        }
                                    } // onClicked
                                 } // Switch
                            }// Row

                            Row{
                                spacing:    _margins
                                QGCLabel {
                                    id:                 wpIdxLabel
                                    //anchors.baseline:   rtbSwitch.baseline
                                    text:               qsTr("Orbit WP Idx")
                                }

                                FactTextField {
                                    id:                 wpIdx
                                    validator:          DoubleValidator {bottom: 1; top: 9;}
                                    fact:               controller.getParameterFact(-1, "CMDS_VIEW_IDX")
                                }
                            }

                        } // Column
                    } // Rectangle - RTB
                } // Rectangle - RTB Label
            } // Flow
        } // Column
    } // Component
} // SetupView
