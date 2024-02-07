class_name PerkCard extends Control

var perksCallbackList: Array[Dictionary]

func updateContent(content: Perk):
	%Title.text = content.title
	
	%Description.clear()
	perksCallbackList.clear()
	
	for mod in content.modifiers:
		%Description.append_text(mod.description + "\n")
		perksCallbackList.append({
			modifier = mod.modifier,
			amount = mod.amount,
			statName = mod.statName
		})
		
func _on_button_pressed():
	for perkCallback in perksCallbackList:
		perkCallback.modifier.call(
			perkCallback.statName, 
			perkCallback.amount
		)

