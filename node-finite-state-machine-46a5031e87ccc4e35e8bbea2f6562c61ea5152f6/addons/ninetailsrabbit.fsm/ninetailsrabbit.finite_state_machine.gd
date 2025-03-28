@tool
extends EditorPlugin

const UpdateNotifyToolScene = preload("updater/update_notify_tool.tscn")

var update_notify_tool_instance: Node

func _enter_tree() -> void:
	MyPluginSettings.set_update_notification()
	_setup_updater()
	
	if not DirAccess.dir_exists_absolute(MyPluginSettings.PluginTemporaryReleaseUpdateDirectoryPath):
		DirAccess.make_dir_recursive_absolute(MyPluginSettings.PluginTemporaryReleaseUpdateDirectoryPath)
	
	add_custom_type("MachineState", "Node", preload("src/machine_state.gd"), preload("assets/state.png"))
	add_custom_type("FiniteStateMachine", "Node", preload("src/finite-state-machine.gd"), preload("assets/fsm.png"))
	
	
func _exit_tree() -> void:
	MyPluginSettings.remove_settings()
	
	if update_notify_tool_instance:
		update_notify_tool_instance.free()
		update_notify_tool_instance = null
		
	remove_custom_type("MachineState")
	remove_custom_type("FiniteStateMachine")

## Update tool referenced from https://github.com/MikeSchulze/gdUnit4/blob/master/addons/gdUnit4
func _setup_updater() -> void:
	if MyPluginSettings.is_update_notification_enabled():
		update_notify_tool_instance = UpdateNotifyToolScene.instantiate()
		Engine.get_main_loop().root.add_child.call_deferred(update_notify_tool_instance)
