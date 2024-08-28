<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/spotify_xml">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <title>SPOTIFY API</title>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" type="text/css" media="screen" href="main.css"/>
                <style>body {
                        font-family: 'Arial', sans-serif;
                        background-color: #272727;
                        height: auto;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        flex-direction: column;
                        margin: 0;
                    }

                    main {
                        display: flex;
                        flex-wrap: wrap;
                        justify-content: center;
                        gap: 20px;
                        padding: 20px;
                        width: 100%;
                        max-width: 100%;
                    }

                    .music-card {
                        background-color: #333;
                        width: 300px;
                        border-radius: 15px;
                        overflow: hidden;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                        transition: transform 0.2s ease-in-out;
                        display: flex;
                        flex-direction: column;
                    }

                    .music-card:hover {
                        transform: scale(1.05);
                    }

                    .music-card-image {
                        position: relative;
                        overflow: hidden;
                    }

                    .music-card-image img {
                        width: 100%;
                        height: auto;
                        display: block;
                        transition: opacity 0.3s ease;
                    }

                    .music-card:hover .music-card-image img {
                        opacity: 0.6;
                    }

                    .play-button {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        background: transparent;
                        border: none;
                        border-radius: 50%;
                        width: 350px;
                        height: 350px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        cursor: pointer;
                        transition: background 0.3s ease, transform 0.3s ease;
                        opacity: 0;
                    }

                    .music-card:hover .play-button {
                        opacity: 1;
                    }

                    .play-button svg {
                        fill: white;
                        width: 48px;
                        height: 48px;
                        transition: fill 0.3s ease;
                    }

                    .play-button.playing svg {
                        fill: red;
                    }

                    .music-card-name {
                        background-color: #444;
                        padding: 15px;
                        text-align: center;
                        flex-grow: 1;
                    }

                    .music-card-name h1 {
                        color: #fff;
                        font-size: 1.5rem;
                        margin: 0;
                        text-transform: uppercase;
                    }

                    .music-card-author {
                        background-color: #555;
                        padding: 10px;
                        text-align: center;
                        height: auto;
                    }

                    .music-card-author h3 {
                        color: #ddd;
                        font-size: 1rem;
                        margin: 0;
                        font-weight: normal;
                    }

                    footer {
                        text-align: center;
                        margin-top: 20px;
                        font-size: 0.9rem;
                        color: #666;
                    }</style>
            </head>
            <body>
                <header style="align-items: center; text-align:center; color: whitesmoke;">
                    <h1>Spotify API by ozgur.yavuz</h1>
                </header>
                <main>
                    <xsl:for-each select="tracks/items/track">
                        <div class="music-card">
                            <div class="music-card-image">
                                <img src="{album/images[1]/url}"/>
                                <button class="play-button" aria-label="Play/Pause" data-preview-url="{preview_url}">
                                    <svg viewBox="0 0 24 24" class="play-icon">
                                        <path d="M8 5v14l11-7z"/>
                                    </svg>
                                    <svg viewBox="0 0 24 24" class="pause-icon" style="display: none;">
                                        <path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/>
                                    </svg>
                                </button>
                                <audio class="audio-player">
                                    <source type="audio/mpeg" src="{preview_url}"/>
                                </audio>
                            </div>
                            <div class="music-card-name">
                                <h1>
                                    <xsl:value-of select="name"/>
                                </h1>
                            </div>
                            <div class="music-card-author">
                                <h3>
                                    <xsl:value-of select="artists/name[1]"/>
                                </h3>
                            </div>
                        </div>
                    </xsl:for-each>
                </main>
                <footer>
                    <p>© 2024 Spotify API ozgur_yavuz</p>
                </footer>
                <script>document.querySelectorAll('.play-button').forEach(button => {
                        const audioPlayer = button.nextElementSibling; // audio elementini seçiyoruz
                        const playIcon = button.querySelector('.play-icon');
                        const pauseIcon = button.querySelector('.pause-icon');
                        let isPlaying = false;

                        button.addEventListener('click', () => {
                            if (isPlaying) {
                                audioPlayer.pause();
                                playIcon.style.display = 'block';
                                pauseIcon.style.display = 'none';
                                isPlaying = false;
                            } else {
                                audioPlayer.play();
                                playIcon.style.display = 'none';
                                pauseIcon.style.display = 'block';
                                isPlaying = true;
                            }
                        });
                    });</script>
            </body>
        </html>
    </xsl:template>
</xsl:transform>