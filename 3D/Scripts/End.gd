extends Area3D  # Узел должен быть типа Area3D для работы с сигналом body_entered

@onready var menu = $"/root/World/CanvasLayer/Control"  # Укажите корректный путь к меню

func _ready():
	# Подключаем сигнал пересечения тела
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is CharacterBody3D:  # Проверяем, что это игрок
		_show_menu()

func _show_menu():
	menu.visible = true  # Показываем меню
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Включаем отображение курсора

# Вызывается при нажатии на кнопку "Закрыть"
func _on_quit_button_pressed():
	get_tree().quit()  # Закрываем игру
