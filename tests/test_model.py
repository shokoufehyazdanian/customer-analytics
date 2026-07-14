import os


def test_model_module_imports():
    import api.app.model

    assert api.app.model is not None