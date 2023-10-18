import QtQuick 2.15
import QtQuick.Controls

Label {
    id: location_address
    width: parent.width

    property string address

    text: address || 'Address'
    font {
        bold: true
        pointSize: location_name.font.pointSize * 0.8
    }
    wrapMode: Text.WordWrap
    opacity: 0.5
}
