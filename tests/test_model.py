import os


def test_model_exists():
    path = "ml/models/churn_model.pkl"

    assert os.path.exists(path)