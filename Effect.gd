tool
extends Node2D

export (String,"Empty",
		"MoveDown", 
		"MoveUp",
		"MoveRight",
		"MoveLeft",
		"FadeOut",
		"TopRigthCorner",
		"TopLeftCorner",
		"BottomRigthCorner",
		"BottomLeftCorner",
		"UpDown",
		"LeftRigth",
		"Center"
		) var effect = "Empty"
export(float) var time = 1
export(Color, RGBA) var color 

var node
var node_position
var screen_size

var tween = Tween.new()
var colorRect1 = ColorRect.new()
var colorRect2 = ColorRect.new()
var colorRect3 = ColorRect.new()
var colorRect4 = ColorRect.new()
#

func _ready():
	node = get_node(self.get_path())
	screen_size = get_viewport_rect().size
	node.set_position(Vector2.ZERO)
	start_transition()


	
func start_transition(): 
	node_position = self.position
	var max_z = get_parent().get_child_count()
	node.set_z_index(max_z +1)
	node.visible = true

	match effect :
		"Empty": node.hide()
		"MoveDown" : move_down()
		"MoveUp" : move_up()
		"MoveLeft" : move_left()
		"MoveRight" : move_right()
		"FadeOut" : fade_out()
		"TopRigthCorner" : top_right_corner()
		"TopLeftCorner" : top_left_corner()
		"BottomRigthCorner" : bottom_rigth_corner()
		"BottomLeftCorner" : bottom_left_corner()
		"UpDown" : up_down()
		"LeftRigth" : left_rigth()
		"Center" : center()
	

func _get_configuration_warning():
	return "The effect is set by default on EMPTY, you have to choose an effect of the list"
	
	
func move_down():
	add_child(tween)
	add_child(colorRect1)
	colorRect1.color = color
	colorRect1.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y + screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_completed")
	node.visible = false
	
	
func move_up():
	add_child(tween)
	add_child(colorRect1)
	colorRect1.color = color
	colorRect1.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y - screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_completed")
	node.visible = false
	
	
func move_left():
	add_child(tween)
	add_child(colorRect1)
	colorRect1.color = color
	colorRect1.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x - screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_completed")
	node.visible = false
	

func move_right():
	add_child(tween)
	add_child(colorRect1)
	colorRect1.color = color
	colorRect1.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x + screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_completed")
	node.visible = false
	
	
func fade_out():
	add_child(tween)
	add_child(colorRect1)
	colorRect1.color = color
	colorRect1.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"modulate:a",1,0,time,Tween.TRANS_SINE,Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_completed")
	node.visible = false
	

func top_right_corner():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	colorRect1.color = color
	colorRect2.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y - screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x + screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false
	
	
func top_left_corner():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	colorRect1.color = color
	colorRect2.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y - screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x - screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false
	

func bottom_rigth_corner():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	colorRect1.color = color
	colorRect2.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y + screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x + screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false
	
	
func bottom_left_corner():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	colorRect1.color = color
	colorRect2.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y + screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x - screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false
	
	
func up_down():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	colorRect1.color = color
	colorRect2.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y - screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y + screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false
	
	
func left_rigth():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	colorRect1.color = color
	colorRect2.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x - screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x + screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false
	
	
func center():
	add_child(tween)
	add_child(colorRect1)
	add_child(colorRect2)
	add_child(colorRect3)
	add_child(colorRect4)
	colorRect1.color = color
	colorRect2.color = color
	colorRect3.color = color
	colorRect4.color = color
	colorRect1.rect_size = screen_size
	colorRect2.rect_size = screen_size
	colorRect3.rect_size = screen_size
	colorRect4.rect_size = screen_size
	
	tween.interpolate_property(colorRect1,
	"rect_position",node_position,
	Vector2(node_position.x - screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect2,
	"rect_position",node_position,
	Vector2(node_position.x + screen_size.x , node_position.y) ,time,
	Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect3,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y - screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.interpolate_property(colorRect4,
	"rect_position",node_position,
	Vector2(node_position.x , node_position.y + screen_size.y),
	time,Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween,"tween_all_completed")
	node.visible = false

