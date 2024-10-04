if data.raw.item["storage-tank"].rocket_launch_products then
    table.insert(data.raw["item"]["storage-tank"].rocket_launch_products, {"raw-fish", 100})
elseif data.raw.item["storage-tank"].rocket_launch_product then
    data.raw.item["storage-tank"].rocket_launch_products = {
        data.raw.item["storage-tank"].rocket_launch_product,
        {"raw-fish", 100}
    }
    data.raw.item["storage-tank"].rocket_launch_product = nil
else
    data.raw["item"]["storage-tank"].rocket_launch_product = {"raw-fish", 100}
end