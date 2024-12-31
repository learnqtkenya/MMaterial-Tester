#pragma once

#include <QObject>
#include <QAbstractListModel>
#include <QSortFilterProxyModel>
#include <QtQmlIntegration>

class IconListModel : public QAbstractListModel
{
	Q_OBJECT

public:
	explicit IconListModel(QObject* parent = nullptr);

	enum Role {
		NameRole = Qt::UserRole + 1
	};

	int rowCount(const QModelIndex& parent = QModelIndex()) const override;
	QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

	// Modifiers
	void addIcon(const QString& iconName);
	void addIcons(const QStringList& iconNames);
	void removeIcon(const QString& iconName);
	void clear();

private:
	QStringList m_iconList;
};

class IconFilterProxyModel : public QSortFilterProxyModel
{
	Q_OBJECT
	QML_ELEMENT
	QML_ANONYMOUS

public:
	explicit IconFilterProxyModel(QObject* parent = nullptr);

protected:
	bool filterAcceptsRow(int sourceRow, const QModelIndex& sourceParent) const override;
	bool lessThan(const QModelIndex& left, const QModelIndex& right) const override;
};

class IconList : public QObject
{
	Q_OBJECT
	QML_ELEMENT

	Q_PROPERTY(QStringList iconList READ iconList WRITE setIconList NOTIFY iconListChanged REQUIRED)
	Q_PROPERTY(IconFilterProxyModel* iconFilterProxyModel READ iconFilterProxyModel CONSTANT)

public:
	explicit IconList(QObject* parent = nullptr);

	QStringList iconList() const;
	void setIconList(const QStringList &iconList);

	IconListModel* iconListModel() const;
	IconFilterProxyModel* iconFilterProxyModel() const;

signals:
	void iconListChanged();

private:
	IconListModel* m_iconListModel;
	IconFilterProxyModel* m_iconFilterProxyModel;

	QStringList m_iconList;
};
