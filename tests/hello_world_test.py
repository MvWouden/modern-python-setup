# -*- coding: utf-8 -*-
from src.hello_world import get_hello_world


def test_hello_world() -> None:
    """ """
    assert get_hello_world() == "Hello World!"
