roll_1 = roll(ns = 100, nw = 100)
roll_2 = roll(ns = 20, nw = 120)
roll_3 = roll(ns = 10, nw = 10)

expect_identical(mode(roll_1), "numeric")
