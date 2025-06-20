#
# SPDX-License-Identifier: Apache-2.0
#

board_runner_args(pyocd "--target=k32l2b3")
board_runner_args(linkserver "--device=K32L2B31A:FRDM-K32L2B")

include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/linkserver.board.cmake)
