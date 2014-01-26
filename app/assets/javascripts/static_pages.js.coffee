# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# Displays the correct index on the display

updateCarouselIndex = (element, action) ->
	if(action == 'prev') # go back an image
		orderedList = document.getElementsByTagName("OL")[0] # first ol
		elementList = orderedList.getElementsByTagName("LI")
		for element in elementList
			if(element.className == 'active')
				activeElement = element

		oldIndex = parseInt(activeElement.getAttribute("data-slide-to"), 10)
		newIndex = oldIndex - 1

		if (newIndex < 0)
			newIndex = elementList.length - 1

		activeElement.setAttribute("class", "")
		newElement = elementList[newIndex]
		newElement.setAttribute("class", "active")

		displayPhoto(newIndex)

		return false

	else
		if(action == 'next') # go to next image
			orderedList = document.getElementsByTagName("OL")[0] # first ol
			elementList = orderedList.getElementsByTagName("LI")
			for element in elementList
				if(element.className == 'active')
					activeElement = element

			oldIndex = parseInt(activeElement.getAttribute("data-slide-to"), 10)
			newIndex = oldIndex + 1

			if (newIndex > (elementList.length - 1))
				newIndex = parseInt(0, 10)

			activeElement.setAttribute("class", "")
			newElement = elementList[newIndex]
			newElement.setAttribute("class", "active")

			displayPhoto(newIndex)

			return false


# Displays the correct photo

displayPhoto = (newIndex) ->
	divList = document.getElementsByTagName("DIV")

	for div in divList
		if(div.className == 'carousel-inner')
			photoDiv = div

	photos = photoDiv.getElementsByTagName("DIV")
	
	for photo in photos
		photo.setAttribute("class", "item")

	photos[newIndex].setAttribute("class", "item active")


# Handles clicks on the data slide a elements

$ ->
  $("a[data-slide]").click ->
    action = $(this).data("slide")
    updateCarouselIndex(this, action)

