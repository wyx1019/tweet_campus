# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Admin",
             email: "admin@gmail.com",
             year: "2018年度",
             major: "Webデザイン科",
             password: "000000",
             password_confirmation: "000000",
             admin: true )

User.create!(name:  "abc",
                email: "abc@gmail.com",
                year: "2018年度",
                major: "Webデザイン科",
                password: "000000",
                password_confirmation: "000000",
                admin: false )
User.create!(name:  "bcd",
            email: "bcd@gmail.com",
            year: "2018年度",
            major: "Webデザイン科",
            password: "000000",
            password_confirmation: "000000",
            admin: false )

User.create!(name:  "cde",
            email: "cde@gmail.com",
            year: "2018年度",
            major: "Webデザイン科",
            password: "000000",
            password_confirmation: "000000",
            admin: false )
User.create!(name:  "def",
            email: "def@gmail.com",
            year: "2018年度",
            major: "Webデザイン科",
            password: "000000",
            password_confirmation: "000000",
            admin: false )