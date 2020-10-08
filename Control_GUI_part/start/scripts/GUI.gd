extends MarginContainer

signal update_health

var animated_health = 0

onready var number_label = $Bars/LifeBar/Count/Background/Number
onready var bar = $Bars/LifeBar/TextureProgress
onready var tween = $Tween

func _ready():
	var animated_health  = $"../Characters/Player".max_health
	bar.max_value = animated_health
	update_health(animated_health)
	pass


func _on_Player_health_changed(animated_health):
	update_health(animated_health)
	pass # Replace with function body.

func update_health(new_value):
	tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6)
	if not tween.is_active():
		tween.start()
		
	pass
	
func _process(delta):
	var round_value = round(animated_health)
	number_label.text = str(round_value)
	bar.value = round_value
	pass


func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 1.0)
	pass # Replace with function body.
