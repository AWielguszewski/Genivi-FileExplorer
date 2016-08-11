import QtQuick 2.0
import QtQuick.Controls 1.3
import Qt.labs.folderlistmodel 2.1



Rectangle {
    id: window
    visible: true
    width: 1920
    height: 1080
    color: "#161616"
    signal qmlSignal(string msg)



    Rectangle {
        id: rectangle3
        x: 0
        y: 96
        width: 1920
        height: 750
        color: "#000000"
        border.width: 2
        opacity: 1
    }

    Rectangle {
        id: detailsRec
        x: -1
        y: 844
        width: 500
        height: 240
        color: "#271e58"
        visible: true
        opacity: 0.5
    }


    Rectangle {
        id: pathRec
        x: -1
        y: -4
        width: 500
        height: 100
        color: "#271e58"
        opacity: 0.5
        visible: true
    }


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
            color: ListView.isCurrentItem ? "white" : "transparent"
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
                    color: wrapper.ListView.isCurrentItem ? "black" : "white"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }



    Rectangle {
        id: listRec
        x: -1
        y: 95
        width: 500
        height: 750
        color: "#271e58"
        visible: true
    }


    ListView {
        id: fileList
        x: 57
        y: 146
        width: 400; height: 652
        antialiasing: true
        clip: false
        orientation: ListView.Vertical
        highlightRangeMode: ListView.NoHighlightRange
        snapMode: ListView.NoSnap
        spacing: 0
        contentHeight: 450
        focus: true

        model: fileModel
        delegate: fileDelegate
    }







    Text {
        id: currDirLabel
        x: 157
        y: 27
        width: 185
        height: 20
        color: "#f4f4f4"
        text: qsTr("Current directory:")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        style: Text.Normal
        font.bold: false
        font.pixelSize: 20
    }




    Text {
        id: listLabel
        x: 201
        y: 109
        width: 96
        height: 20
        color: "#f4f4f4"
        text: qsTr("File list:")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        style: Text.Normal
        font.bold: false
        font.pixelSize: 20
    }




    Text {
        id: detailsLabel
        x: 212
        y: 868
        width: 90
        height: 20
        color: "#f4f4f4"
        text: qsTr("Details:")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        style: Text.Normal
        font.bold: false
        font.pixelSize: 20
    }




    Text {
        id: currDirTxt
        x: 57
        y: 59
        width: 400
        height: 20
        color: "#bdbdbd"
        text: fileModel.folder
        styleColor: "#000000"
        style: Text.Normal
        font.italic: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }



    Rectangle {
        id: rectangle2
        x: 610
        y: 96
        width: 1206
        height: 750
        color: "#ffffff"
        border.width: 0
        opacity: 0.9
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
        id: detFileSize
        x: 75
        y: 959
        width: 364
        height: 30
        color: "#bdbdbd"
        text: "<b>File size:</b> " + fileModel.get(fileList.currentIndex,"fileSize") +" B"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 17
    }



    Text {
        id: detFileName
        x: 75
        y: 913
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
        id: detFileType
        x: 75
        y: 1006
        width: 364
        height: 30
        color: "#bdbdbd"
        text: "<b>File type:</b> " + (fileModel.get(fileList.currentIndex,"fileIsDir") ? "Directory" : "File")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 17
    }



    Text {
        id: text1
        x: 705
        y: 455
        width: 1000
        height: 40
        text: qsTr("player")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 30
    }









}
