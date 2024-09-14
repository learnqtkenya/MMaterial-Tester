#pragma once

#include <QAbstractListModel>
#include <QObject>
#include <QQmlListProperty>
#include <qqmlintegration.h>
#include <QColor>

class ChartElementBar : public QObject
{
	Q_OBJECT
	QML_ELEMENT

	Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
	Q_PROPERTY(double value READ value WRITE setValue NOTIFY valueChanged FINAL)
	Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged FINAL)
public:
	ChartElementBar(QObject* parent = nullptr);

	QString name() const;
	void setName(const QString& newName);

	double value() const;
	void setValue(double newValue);

	QString color() const;
	void setColor(const QString& newColor);

signals:
	void nameChanged();
	void valueChanged();
	void colorChanged();

private:
	QString m_name;
	double m_value;
	QString m_color;
};

class ChartElement : public QAbstractListModel
{
	Q_OBJECT
	QML_ELEMENT

	Q_PROPERTY(QQmlListProperty<ChartElementBar> bars READ model)
	Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)

public:
	ChartElement(QObject* parent = nullptr);

	enum RoleNames
	{
		NameRole = Qt::UserRole + 1,
		BarNameRole,
		BarValueRole,
		BarColorRole
	};

	int rowCount(const QModelIndex& parent) const override;
	QVariant data(const QModelIndex& index, int role) const override;
	QHash<int, QByteArray> roleNames() const override;

	Q_INVOKABLE void insert(int index, ChartElementBar* bar);
	Q_INVOKABLE void insertEmpty(int index);
	Q_INVOKABLE void remove(int index);

	QList<ChartElementBar*> bars() const;
	void setBars(const QList<ChartElementBar*>& newBars);

	QQmlListProperty<ChartElementBar> model();

	QString name() const;
	void setName(const QString& newName);

signals:
	void nameChanged();

private:
	QList<ChartElementBar*> m_bars;
	QString m_name;
};

class ChartModel : public QAbstractListModel
{
	Q_OBJECT
	QML_ELEMENT
	Q_PROPERTY(QQmlListProperty<ChartElement> model READ model)
	Q_PROPERTY(int count READ count NOTIFY countChanged)

public:
	ChartModel(QObject* parent = nullptr);

	enum RoleNames {
		ElementRole = Qt::UserRole + 1,
		NameRole
	};

	int count();
	int rowCount(const QModelIndex& parent) const override;
	QVariant data(const QModelIndex& index, int role) const override;
	bool setData(const QModelIndex &index, const QVariant &value, int role) override;

	QHash<int, QByteArray> roleNames() const override;

	QList<ChartElement*> elements() const;
	void setElements(const QList<ChartElement*>& newElements);

	Q_INVOKABLE void insert(int index, ChartElement* bar);
	Q_INVOKABLE void insertEmpty(int index);
	Q_INVOKABLE void remove(int index);

	Q_INVOKABLE double getMinValue() const;
	Q_INVOKABLE double getMaxValue() const;

	QQmlListProperty<ChartElement> model();

signals:
	void countChanged();

private:
	QList<ChartElement*> m_elements;

};
