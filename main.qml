import QtQuick 2.0
import QtQuick.Controls 1.3
import Qt.labs.folderlistmodel 2.1



Rectangle {
    id: window
    visible: true
    width: 1920
    height: 1080
    color: "#223974"
    signal qmlSignal(string msg)


    FolderListModel {
        id: fileModel
        folder: "file:///"
        showDirsFirst: true
        showHidden: true
    }

    Component {
        id: fileDelegate
        Rectangle {
            id: wrapper
            width: 400
            height: img.height
            border.width: 1
            color: ListView.isCurrentItem ? "black" : "white"
            Image{
                id: img
                source: fileIsDir ? "file:/media/folder.png" : "file:/media/file.png"
                x: 3
                y: -2
                height: 30
                width: 30
                Text {
                    id: contactInfo
                    x: 70
                    y: 7
                    text: wrapper.ListView.isCurrentItem ? "<b>" + fileName +"</b>" : fileName
                    color: wrapper.ListView.isCurrentItem ? "white" : "black"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 61
        y: 125
        width: 400
        height: 694
        color: "#ffffff"
        opacity: 0.5
    }


    ListView {
        id: fileList
        x: 57
        y: 120
        width: 400; height: 686
        antialiasing: true
        clip: false
        orientation: ListView.Vertical
        highlightRangeMode: ListView.NoHighlightRange
        snapMode: ListView.NoSnap
        spacing: 5
        contentHeight: 450
        focus: true

        model: fileModel
        delegate: fileDelegate
    }


    Rectangle {
        id: rectangle3
        x: 61
        y: 880
        width: 400
        height: 151
        color: "#ffffff"
        opacity: 0.5
    }

    Rectangle {
        id: details
        x: 57
        y: 876
        width: 400
        height: 152
        color: "#000000"
        border.color: "#fbfbfb"

        Text {
            id: detFileName
            x: 18
            y: 15
            width: 364
            height: 30
            color: "#bdbdbd"
            text: "<b>File name:</b> " + "<i>" + fileModel.get(fileList.currentIndex,"fileName") + "</i>"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.italic: false
            font.underline: false
            styleColor: "#ffffff"
            style: Text.Normal
            font.pixelSize: 17
        }

        Text {
            id: detFileSize
            x: 18
            y: 61
            width: 364
            height: 30
            color: "#bdbdbd"
            text: "<b>File size:</b> " + fileModel.get(fileList.currentIndex,"fileSize") +" B"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 17
        }

        Text {
            id: detFileType
            x: 18
            y: 108
            width: 364
            height: 30
            color: "#bdbdbd"
            text: "<b>File type:</b> " + (fileModel.get(fileList.currentIndex,"fileIsDir") ? "Directory" : "File")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 17
        }
    }


    Rectangle {
        id: currDirSha
        x: 61
        y: 57
        width: 400
        height: 31
        color: "#fdfdfd"
        opacity: 0.5
    }


    Rectangle {
        id: currFirRec
        x: 57
        y: 53
        width: 400
        height: 31
        color: "#000000"
        border.color: "#ffffff"
        opacity: 1

        Text {
            id: currDirTxt
            x: 0
            y: 6
            width: 400
            height: 20
            color: "#ffffff"
            text: fileModel.folder
            styleColor: "#000000"
            style: Text.Sunken
            font.italic: true
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }
    }


    Text {
        id: currDirLabel
        x: 159
        y: 27
        width: 150
        height: 20
        color: "#f4f4f4"
        text: qsTr("Current directory:")
        style: Text.Normal
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 20
    }


    Text {
        id: listLabel
        x: 209
        y: 94
        width: 96
        height: 20
        color: "#f4f4f4"
        text: qsTr("File list:")
        font.family: "Tahoma"
        style: Text.Normal
        font.bold: true
        font.pixelSize: 20
    }


    Text {
        id: detailsLabel
        x: 212
        y: 845
        width: 90
        height: 20
        color: "#f4f4f4"
        text: qsTr("Details:")
        font.family: "Verdana"
        style: Text.Normal
        font.bold: true
        font.pixelSize: 20
    }


    Rectangle {
        id: rectangle2
        x: 510
        y: 53
        width: 1346
        height: 766
        color: "#ffffff"
        border.width: 2
        opacity: 0.6
    }

    Keys.onPressed: {
        if(event.key === Qt.Key_Enter){
            event.accepted = true;
            if(fileModel.get(fileList.currentIndex,"fileIsDir")){
                fileModel.folder = "file:" + fileModel.get(fileList.currentIndex,"filePath")
            }
        }
        if(event.key === Qt.Key_Backspace){
            event.accepted = true;
            if(fileModel.parentFolder != "")
                fileModel.folder = fileModel.parentFolder
        }
    }


    Text {
        id: text1
        x: 678
        y: 364
        width: 1000
        height: 40
        text: qsTr("player")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 30
    }

}
