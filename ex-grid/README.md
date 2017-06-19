# Grid example

An example of a grid-based system using an html `table` and `tr` / `td`s.  We have 24x24 cells each dimensioned by the viewport width.  Using this method, we can select specific cells without there needing to be extra labels.

We can target a row and column by using the `nth-child` selector:

`tr:nth-child(row_number) td:nth-child(column_number)`