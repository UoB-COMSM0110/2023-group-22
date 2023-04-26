P6 test Part：

In this section, we will discuss the qualitative and quantitative evaluation methods we used to assess our Doodle Jump game. We also describe how the code was tested during the development process and the benefits of using a combination of evaluation methods for our game development.

Qualitative Evaluation: To evaluate the game qualitatively, we distributed the game to several classmates without providing any instructions on the gameplay. This allowed us to assess the clarity of the in-game instructions and the intuitiveness of the game's interface and interactions. By observing the players' reactions and collecting their feedback, we could identify areas where the user experience could be improved. For example, if players struggled to understand the game mechanics or found the controls unintuitive, we could make adjustments accordingly.

One crucial aspect of qualitative evaluation is the diversity of players participating in the testing. By including individuals with different gaming backgrounds and preferences, we could ensure that the feedback was representative of a broader audience. This is especially important for a game like Doodle Jump, which aims to appeal to casual gamers and experienced players alike.

Quantitative Evaluation: For the quantitative evaluation, we employed the equivalence partitioning testing method. This involved modifying the functions in the code so that when the mouse cursor interacted with specific locations, the corresponding information would be logged in a file. By reviewing this log file, we could identify valid and invalid operations and calculate metrics, such as the success rate of button clicks or the number of invalid operations performed by players.

Quantitative evaluation is essential because it allows us to objectively measure the game's performance and identify any issues with the code or user interface. By comparing the results of our testing against predetermined benchmarks, we can determine if the game meets our quality standards and adjust the code accordingly if it does not.

Code Testing: During the development process, we made sure to test the code thoroughly. This involved running the game multiple times and checking for any issues or inconsistencies in the gameplay. As we made adjustments and improvements, we continually tested the game to ensure that all changes functioned as intended. This iterative approach to code testing helped us identify and fix bugs and other issues quickly, ultimately resulting in a more polished final product.

In addition to our own internal testing, we also leveraged user testing to identify any issues that we may have overlooked. By observing real players interacting with the game, we could gain valuable insights into how the game was being played and make adjustments based on their feedback. This combination of internal and external testing allowed us to create a more refined and enjoyable gaming experience.

Benefits of Using a Combination of Evaluation Methods: By using both qualitative and quantitative evaluation methods, we were able to gather a more comprehensive understanding of the game's strengths and weaknesses. The qualitative evaluation provided insights into the user experience and overall enjoyability of the game, while the quantitative evaluation allowed us to objectively measure the game's performance and identify any technical issues. By addressing these issues and incorporating player feedback, we were able to create a well-rounded and enjoyable gaming experience that appealed to a wide range of players.

In conclusion, our evaluation process consisted of a qualitative evaluation, where we distributed the game to our classmates to assess the clarity and intuitiveness of the game, and a quantitative evaluation, where we used equivalence partitioning testing to evaluate the game's interactions. Additionally, we thoroughly tested the code during the development process and leveraged user testing to gain valuable insights. By using both of these evaluation methods and implementing an iterative approach to code testing, we were able to identify and address any issues in our game, resulting in a more polished and enjoyable gaming experience.



And , Here is an excerpt from the table:

## Start menu：

| **Category**                  |       | **Condition**      |
| ----------------------------- | ----- | ------------------ |
| valid help button x           | HX_1  | 15 ≤ x ≤ 50        |
| invalid help button x         | HX_2  | x < 15 or x > 50   |
| valid help button y           | HY_1  | 14 ≤ y ≤ 53        |
| invalid help button y         | HY_2  | y < 14 or y > 53   |
| valid setting button x        | SX_1  | 315 ≤ x ≤ 400      |
| invalid setting button x      | SX_2  | x < 315 or x > 400 |
| valid setting button y        | SY_1  | 0 ≤ y ≤ 90         |
| invalid setting button y      | SY_2  | y < 0 or y > 90    |
| valid character selection y   | CSY_1 | 400 ≤ y ≤ 505      |
| invalid character selection y | CSY_2 | y < 400 or y > 505 |
| valid left character x        | LCX_1 | 17 ≤ x ≤ 141       |
| invalid left character x      | LCX_2 | x < 17 or x > 141  |
| valid middle character x      | MCX_1 | 142 ≤ x ≤ 232      |
| invalid middle character x    | MCX_2 | x < 142 or x > 232 |
| valid right character x       | RCX_1 | 233 ≤ x ≤ 400      |
| invalid right character x     | RCX_2 | x < 233 or x > 400 |



## Game mode：

| **Category**                     |       | **Condition**        |
| -------------------------------- | ----- | -------------------- |
| valid doodle x (normal mode)     | DX_1  | 0 ≤ x ≤ 400          |
| valid doodle y (normal mode)     | DY_1  | y ≥ 0                |
| valid doodle x (Downstairs mode) | DX_2  | 0 ≤ x ≤ 400          |
| valid doodle y (Downstairs mode) | DY_2  | y ≤ 0                |
| invalid doodle x                 | DX_3  | x < 0 or x > 400     |
| valid sos brick x                | SBX_1 | x = doodle's x value |
| valid sos brick y                | SBY_1 | y > doodle's y value |
| invalid sos brick x              | SBX_2 | x ≠ doodle's x value |
| invalid sos brick y              | SBY_2 | y ≤ doodle's y value |
| valid ordinary brick x           | OBX_1 | 0 ≤ x ≤ 400          |
| valid ordinary brick y           | OBY_1 | 0 ≤ y ≤ 600          |
| invalid ordinary brick x         | OBX_2 | x < 0 or x > 400     |
| invalid ordinary brick y         | OBY_2 | y < 0 or y > 600     |
| valid setting button x           | SX_1  | 340 ≤ x ≤ 370        |
| invalid setting button x         | SX_2  | x < 340 or x > 370   |
| valid setting button y           | SY_1  | 20 ≤ y ≤ 50          |
| invalid setting button y         | SY_2  | y < 20 or y > 50     |



## end menu：

| **Category**                        |       | **Condition**      |
| ----------------------------------- | ----- | ------------------ |
| valid end interface home button x   | EHX_1 | 144 ≤ x ≤ 259      |
| invalid end interface home button x | EHX_2 | x < 144 or x > 259 |
| valid end interface home button y   | EHY_1 | 282 ≤ y ≤ 327      |
| invalid end interface home button y | EHY_2 | y < 282 or y > 327 |