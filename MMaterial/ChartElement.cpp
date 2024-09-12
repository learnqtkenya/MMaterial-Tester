#include "ChartElement.h"

ChartElementBar::ChartElementBar(QObject* parent)
	: QObject(parent)
{

}

QString ChartElementBar::name() const
{
	return m_name;
}

void ChartElementBar::setName(const QString& newName)
{
	if (m_name == newName)
		return;
	m_name = newName;
	emit nameChanged();
}

double ChartElementBar::value() const
{
	return m_value;
}

void ChartElementBar::setValue(double newValue)
{
	if (m_value == newValue)
		return;
	m_value = newValue;
	emit valueChanged();
}

QString ChartElementBar::color() const
{
	return m_color;
}

void ChartElementBar::setColor(const QString& newColor)
{
	if (m_color == newColor)
		return;
	m_color = newColor;
	emit colorChanged();
}

ChartElement::ChartElement(QObject* parent)
	: QAbstractListModel(parent)
{

}

int ChartElement::rowCount(const QModelIndex& parent) const
{
	Q_UNUSED(parent)
	return m_bars.size();
}

QVariant ChartElement::data(const QModelIndex& index, int role) const
{
	if (!index.isValid())
		return QVariant();

	if (index.row() >= m_bars.size())
		return QVariant();

	if (role == NameRole)
		return m_name;
	else if (role == BarNameRole)
		return m_bars.at(index.row())->name();
	else if (role == BarValueRole)
		return m_bars.at(index.row())->value();
	else if (role == BarColorRole)
		return m_bars.at(index.row())->color();

	return QVariant();
}

QHash<int, QByteArray> ChartElement::roleNames() const
{
	QHash<int, QByteArray> roles;
	roles[NameRole] = "name";
	roles[BarNameRole] = "barName";
	roles[BarValueRole] = "barValue";
	roles[BarColorRole] = "barColor";
	return roles;
}

void ChartElement::insert(int index, ChartElementBar* bar)
{
	beginInsertRows(QModelIndex(), index, index);
	m_bars.insert(index, bar);
	endInsertRows();
}

void ChartElement::remove(int index)
{
	beginRemoveRows(QModelIndex(), index, index);
	m_bars.takeAt(index)->deleteLater();
	endRemoveRows();
}

QList<ChartElementBar*> ChartElement::bars() const
{
	return m_bars;
}

void ChartElement::setBars(const QList<ChartElementBar*>& newBars)
{
	if (m_bars == newBars)
		return;
	m_bars = newBars;
}

QQmlListProperty<ChartElementBar> ChartElement::model() { return QQmlListProperty<ChartElementBar>(this, &m_bars); }

QString ChartElement::name() const
{
	return m_name;
}

void ChartElement::setName(const QString& newName)
{
	m_name = newName;
	emit nameChanged();
}

ChartModel::ChartModel(QObject* parent)
	: QAbstractListModel(parent)
{

}

int ChartModel::rowCount(const QModelIndex& parent) const
{
	Q_UNUSED(parent)
	return m_elements.size();
}

QVariant ChartModel::data(const QModelIndex& index, int role) const
{
	if (!index.isValid())
		return QVariant();

	if (index.row() >= m_elements.size())
		return QVariant();

	if (role == ElementRole)
		return QVariant::fromValue(m_elements.at(index.row()));

	return QVariant();
}

QHash<int, QByteArray> ChartModel::roleNames() const
{
	QHash<int, QByteArray> roles;
	roles[ElementRole] = "element";
	return roles;
}

QList<ChartElement*> ChartModel::elements() const
{
	return m_elements;
}

void ChartModel::setElements(const QList<ChartElement*>& newElements)
{
	if (m_elements == newElements)
		return;
	m_elements = newElements;
}

void ChartModel::insert(int index, ChartElement* bar)
{
	beginInsertRows(QModelIndex(), index, index);
	m_elements.insert(index, bar);
	endInsertRows();
}

void ChartModel::remove(int index)
{
	beginRemoveRows(QModelIndex(), index, index);
	m_elements.takeAt(index)->deleteLater();
	endRemoveRows();
}

double ChartModel::getMinValue() const
{
	double min = std::numeric_limits<double>::max();
	for (auto element : m_elements)
	{
		for (auto bar : element->bars())
		{
			if (bar->value() < min)
				min = bar->value();
		}
	}
	return min;
}

double ChartModel::getMaxValue() const
{
	double max = std::numeric_limits<double>::min();
	for (auto element : m_elements)
	{
		for (auto bar : element->bars())
		{
			if (bar->value() > max)
				max = bar->value();
		}
	}
	return max;
}

QQmlListProperty<ChartElement> ChartModel::model() { return QQmlListProperty<ChartElement>(this, &m_elements); }
