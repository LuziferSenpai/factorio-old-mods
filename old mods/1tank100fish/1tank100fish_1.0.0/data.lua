if data.raw["item"]["storage-tank"].rocket_launch_product then
	table.insert(data.raw["item"]["storage-tank"].rocket_launch_product, {"raw-fish", 100})
else
	data.raw["item"]["storage-tank"].rocket_launch_product = {"raw-fish", 100}
end