if deadlock_stacking then
	deadlock_stacking.create( "SiSi-quartz", nil, "deadlock-stacking-2", 64 )
end

if deadlock_crating then
	deadlock_crating.create( "SiSi-silicon", "deadlock-crating-2" )
	deadlock_crating.create( "SiSi-silicon-wafer", "deadlock-crating-2" )
	deadlock_crating.create( "SiSi-solar-cell", "deadlock-crating-3" )
end