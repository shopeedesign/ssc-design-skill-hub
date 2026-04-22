#!/usr/bin/env python3
"""Generate TTS audio for all 18 slide scripts using edge-tts (Yunxi male voice)."""
import asyncio
import json
import os
from pathlib import Path

import edge_tts

VOICE = "zh-CN-YunxiNeural"
RATE = "+0%"
PITCH = "+0Hz"

ROOT = Path(__file__).resolve().parent.parent
SCRIPTS_PATH = ROOT / "scripts" / "scripts.json"
AUDIO_DIR = ROOT / "audio"
AUDIO_DIR.mkdir(exist_ok=True)


async def synth_one(item):
    idx = item["id"]
    text = item["script"]
    out = AUDIO_DIR / f"slide-{idx:02d}.mp3"
    communicate = edge_tts.Communicate(text, VOICE, rate=RATE, pitch=PITCH)
    await communicate.save(str(out))
    print(f"[ok] slide-{idx:02d}.mp3  ({len(text)} chars)  {item['title']}")


async def main():
    items = json.loads(SCRIPTS_PATH.read_text(encoding="utf-8"))
    # Limit concurrency to 4 to avoid rate limits.
    sem = asyncio.Semaphore(4)

    async def bounded(item):
        async with sem:
            await synth_one(item)

    await asyncio.gather(*(bounded(i) for i in items))
    print("All done.")


if __name__ == "__main__":
    asyncio.run(main())
