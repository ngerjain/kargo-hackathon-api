# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TmsApi.Repo.insert!(%TmsApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TmsApi.Repo
alias TmsApi.Schema.ShipmentList

Repo.insert! %ShipmentList{license_number: "999111", driver_id: "442", destination: "Bekasi", origin: "Jakarta", loading_date: "29 Agustus 2021", status: "On Going", shipment_number: "DO-0001"}
Repo.insert! %ShipmentList{license_number: "887888", driver_id: "343", destination: "Yogyakarta", origin: "Jakarta", loading_date: "30 Agustus 2021", status: "On Going", shipment_number: "DO-0002"}
Repo.insert! %ShipmentList{license_number: "123456", driver_id: "532", destination: "Bekasi", origin: "Jakarta", loading_date: "29 Agustus 2021", status: "On Going", shipment_number: "DO-0002"}
 