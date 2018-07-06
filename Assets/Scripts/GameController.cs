using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour
{

    public static GameController gc;
    public int currentTachyons, totalTachyonsNeeded;
    public float timeRemaining, totalTimeBeforeJump;

    public GameState currentGameState;

    public RoadRotation road;
    public RoadTextureSwap roadTexSwap;
    public Image fadeToBlackImage, fadeToWhiteImage;
    public int currentLevel;
    public float fadeTimeBetweenLevels;

    public enum GameState
    {
        Menu,
        Paused,
        InLevel,
        GameOver
    }

    // Use this for initialization
    void Awake()
    {
        if (gc == null)
        {
            DontDestroyOnLoad(gameObject);
            gc = this;
        }
        else if (gc != null)
        {
            Destroy(gameObject);
        }

        road = FindObjectOfType<RoadRotation>();
        roadTexSwap = FindObjectOfType<RoadTextureSwap>();
        fadeToBlackImage = GameObject.Find("UICanvas/FadeToBlack").GetComponent<Image>();
        fadeToWhiteImage = GameObject.Find("UICanvas/FadeToWhite").GetComponent<Image>();

        //HACK, change eventually
        currentGameState = GameState.InLevel;
        StartLevel();
    }

    // Update is called once per frame
    void Update()
    {

        switch (currentGameState)
        {
            case GameState.InLevel:
                timeRemaining -= Time.deltaTime;
                if (timeRemaining <= 0)
                {
                    if (currentTachyons < totalTachyonsNeeded) GameOver();
                    else StartCoroutine(ChangeLevel());
                }
                break;
        }


    }

    void StartLevel()
    {
        currentGameState = GameState.InLevel;
        currentTachyons = 0;
        currentLevel = 1;
        timeRemaining = totalTimeBeforeJump;
        fadeToWhiteImage.color = Color.white;
        roadTexSwap.SwapTextures(currentLevel);
        StartCoroutine(FadeFromWhite());
    }

    public IEnumerator ChangeLevel()
    {
        //jump animation
        //fade to white?
        //swap road textures
        //remove all existing objects
        //change spawner 'sets' to new level enemies/obstacles/props
        Color color = new Color(255, 255, 255, 0);
        StartCoroutine(FadeToWhite());

        currentLevel++;
        timeRemaining = totalTimeBeforeJump;
        currentTachyons = 0;
        yield return new WaitForSeconds(fadeTimeBetweenLevels);
        roadTexSwap.SwapTextures(currentLevel);
        StartCoroutine(FadeFromWhite());
        yield return null;
    }

    void GameOver()
    {
        Debug.Log("Game over, man!");
        currentGameState = GameState.GameOver;
        StartCoroutine(SlowToStop());
    }

    public IEnumerator SlowToStop()
    {
        while (road.rotateSpeed > 0)
        {
            road.rotateSpeed -= 5f * Time.deltaTime;
            Debug.Log(road.rotateSpeed);
            yield return null;
        }

        Debug.Log("out of while loop...");
        road.rotateSpeed = 0f;
        Debug.Log(road.rotateSpeed);
        Time.timeScale = 0f;
        StartCoroutine(FadeToBlack());
    }

    public IEnumerator FadeToBlack()
    {
        Debug.Log("Fading to Black");
        while (fadeToBlackImage.color.a < 1.0)
        {
            Color color = new Color(0, 0, 0, fadeToBlackImage.color.a + 0.01f);
            fadeToBlackImage.color = color;
            yield return null;
        }

        SceneManager.LoadScene("gameover", LoadSceneMode.Single);
    }

    public IEnumerator FadeToWhite()
    {
        Debug.Log("Fading to White");
        while (fadeToWhiteImage.color.a < 1.0)
        {
            Color color = new Color(255, 255, 255, fadeToWhiteImage.color.a + 0.01f);
            fadeToWhiteImage.color = color;
            yield return null;
        }
    }

    public IEnumerator FadeFromWhite()
    {
        Debug.Log("Fading from White");
        while (fadeToWhiteImage.color.a > 0.0)
        {
            Color color = new Color(255, 255, 255, fadeToWhiteImage.color.a - 0.01f);
            fadeToWhiteImage.color = color;
            yield return null;
        }
    }
}
