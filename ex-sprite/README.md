# Sprite Demo

This is a demonstration of a sprite-based animation.  Starting from a grid of illustrations of the same character within equally sized cells, we are able to use the image as the background of a container and then adjust the background position to create the appearance of animated frames.

In this sample, we have two keyframe approaches for animations.  The first, which we called **runner** in this example, utilizes percentage ranges on the `background-position` property.  In this implementation we are presuming that the user will not notice anything that occurs within 0.01% of the animation duration.

In the second example, we utilize two animations (runner2_v and runner2_h) that are meant to be implemented via step animation.  Because we have a 5x2 grid, we are going to want to move down vertically half way through the aniamtion -- so the vertical animation will last twice as long over only two steps.

### References

The spritesheet for this demo was borrowed from Patsboro: http://patsobo.com/game-tutorial-sprite-class-part-1/

You could select any other image and apply the same proportions.