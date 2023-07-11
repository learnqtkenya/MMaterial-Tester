import QtQuick 2.15
import QtQuick.Layouts
import MMaterial

Item {
    objectName: "Pagination"
    visible: showcaseLoader.status == Loader.Ready

    Paginator{

    }

}
