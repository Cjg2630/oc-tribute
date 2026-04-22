# Script de CharacterBody2D
# Vamos a utilizar funciones de movimiento

extends CharacterBody2D

# Definimos la velocidad del jugador
# @export permite modificarla desde el editor sin tocar código
@export var speed := 200.0

# Esta función se ejecuta en cada frame de físicas (60 veces por segundo si son 60 fps)

func _physics_process(_delta): # Función para definir físicas. La _ le dice a Godot que esa variable no se usa
	# Vector vacíos (sin movimiento)
	var direction = Vector2.ZERO 
	
	# Movimiento horizontal 
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	# Movimiento vertical
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Normalizamos el vector -> esto evita que movernos en diagonal sea más rápido
	# direction = direction.normalized()
	
	# Calculamos la velocidad final multiplicando:
	velocity = direction * speed
	
	move_and_slide() # Función propia de CharacterBody2D que mueve el personaje y gestiona colisiones
