# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# Displays the correct index on the display

updateCarouselIndex = (action) ->
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

	imageSrc = photos[newIndex].getElementsByTagName("IMG")[0]
	origWidth = imageSrc.width
	origHeight = imageSrc.height
	newHeight = photos[newIndex].clientHeight
	newWidth = Math.round((origWidth * newHeight) / origHeight)
	
	divWidth = photos[newIndex].clientWidth

	if ((newWidth + 20) > divWidth)
		newWidth = divWidth
		newHeight = Math.round((origHeight * newWidth) / origWidth)	
		imageSrc.height = newHeight
		imageSrc.width = newWidth
	else
		if (newWidth < divWidth)
			imageSrc.height = newHeight
			imageSrc.width = newWidth
			widthCalc = ((divWidth - newWidth) / 2)
			imageSrc.style.left = widthCalc + "px"
		else
			imageSrc.height = newHeight
			imageSrc.width = newWidth

	return false



# Updates indicator when one is selected

updateIndicator = (index) ->
	orderedList = document.getElementsByTagName("OL")[0] # first ol
	elementList = orderedList.getElementsByTagName("LI")
	for element in elementList
		element.setAttribute("class", "")

	elementList[index].setAttribute("class", "active")

	return false


# Display selected index

moveToCarouselIndex = (index) ->
	if (isIndexActive(index) == false) # not active so update picture
		displayPhoto(index)
		updateIndicator(index)
	return false


# Checks if index is active

isIndexActive = (index) ->
	orderedList = document.getElementsByTagName("OL")[0] # first ol
	elementList = orderedList.getElementsByTagName("LI")
	selectedElement = elementList[index]

	if (selectedElement.className == "active")
		return true
	else
		return false

# Handles clicks on the data slide a elements
$ ->
	$("a[data-slide]").click ->
		action = $(this).data("slide")
		updateCarouselIndex(action)

$ ->
	$(".carousel-indicators li").click ->
		index = $(this).data("slide-to")
		moveToCarouselIndex(index)

$ ->
	$(document).ready ->
		#updateImages()