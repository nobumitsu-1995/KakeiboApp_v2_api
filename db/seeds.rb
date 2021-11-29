# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
    [
        {
            big_category: 'fixed_cost',
            name: '住居費'
        },
        {
            big_category: 'fixed_cost',
            name: '保険料'
        },
        {
            big_category: 'fixed_cost',
            name: '通信費'
        },
        {
            big_category: 'fixed_cost',
            name: '自動車費'
        },
        {
            big_category: 'fixed_cost',
            name: '光熱費'
        },
        {
            big_category: 'fixed_cost',
            name: '教育費'
        },
        {
            big_category: 'variable_cost',
            name: '食費'
        },
        {
            big_category: 'variable_cost',
            name: '日用費'
        },
        {
            big_category: 'variable_cost',
            name: '交際費'
        },
        {
            big_category: 'variable_cost',
            name: '交通費'
        },
        {
            big_category: 'variable_cost',
            name: '医療費'
        },
        {
            big_category: 'variable_cost',
            name: '美容費'
        },
        {
            big_category: 'variable_cost',
            name: '特別費'
        },
        {
            big_category: 'income',
            name: '給与'
        },
        {
            big_category: 'income',
            name: '副業'
        },
        {
            big_category: 'income',
            name: '雑所得'
        },
    ]
)

PaymentMethod.create!(
    [
        {
            name: '現金'
        },
        {
            name: 'カード'
        },
        {
            name: '引き落とし'
        },
        {
            income: true,
            name: '現金(収入)'
        },
        {
            income: true,
            name: '振り込み'
        },
    ]
)